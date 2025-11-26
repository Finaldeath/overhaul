//:://////////////////////////////////////////////
//:: Blackstaff: On Hit
//:: op_ip_blackstaff
//:://////////////////////////////////////////////
/*
    - On striking a creature, dispel magic is cast on the target (caster check
      of 1d20 + 10).
    - On striking a creature, if they fail a Will save and SR check, then one
      prepared spell (or one unused spell slot, for spellcasters who do not
      prepare spells) of the highest spell level available will be unreadied
      and unavailable to cast.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    // NB: No spell hook in On Hit special scripts.
    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Always dispel magic
        DoDispelMagic(oTarget, min(10, nCasterLevel));

        // Should we change the spell Id to Blackstaff?
        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
            {
                // Remove the highest level spell slot from any class
                ApplyVisualEffectToObject(VFX_IMP_HEAD_ODD, oTarget);

                // Find the class / level slot to clear
                int nClassToClear = CLASS_TYPE_INVALID, nChosenSpellLevel = -1, bMemorised, bRestricted, nChosenSpellId, bDoneClass;

                // First run is to find the slot
                int nClassPosition;
                for (nClassPosition = 1; nClassPosition <= 8; nClassPosition++)
                {
                    int nClass = GetClassByPosition(nClassPosition, oTarget);
                    bDoneClass = FALSE;

                    if (nClass != CLASS_TYPE_INVALID)
                    {
                        if (StringToInt(Get2DAString("classes", "SpellCaster", nClass)))
                        {
                            // Get the highest slot they have work backwards
                            if (StringToInt(Get2DAString("classes", "MemorizesSpells", nClass)))
                            {
                                // Wizard/Cleric style memorised spells
                                int nSpellLevel;
                                for (nSpellLevel = 9; !bDoneClass && nSpellLevel >= 0; nSpellLevel--)
                                {
                                    int nIndex;
                                    for (nIndex = 0; !bDoneClass && nIndex < GetMemorizedSpellCountByLevel(oTarget, nClass, nSpellLevel); nIndex++)
                                    {
                                        if (GetMemorizedSpellReady(oTarget, nClass, nSpellLevel, nIndex) == TRUE)
                                        {
                                            if (nSpellLevel > nChosenSpellLevel)
                                            {
                                                nClassToClear     = nClass;
                                                nChosenSpellLevel = nSpellLevel;
                                                bMemorised        = TRUE;
                                                bDoneClass        = TRUE;
                                            }
                                        }
                                    }
                                }
                            }
                            else
                            {
                                // Sorcerer style not memorised slots
                                // There are two options, all spells are available or only known spells
                                if (StringToInt(Get2DAString("classes", "SpellBookRestricted", nClass)))
                                {
                                    // Check how many known per level
                                    int nSpellLevel;
                                    for (nSpellLevel = 9; !bDoneClass && nSpellLevel >= 0; nSpellLevel--)
                                    {
                                        if (GetKnownSpellCount(oTarget, nClass, nSpellLevel) > 0)
                                        {
                                            int nSpellId = GetKnownSpellId(oTarget, nClass, nSpellLevel, 0);
                                            if (nSpellId >= 0 && GetSpellUsesLeft(oTarget, nClass, nSpellId) > 0)
                                            {
                                                if (nSpellLevel > nChosenSpellLevel)
                                                {
                                                    nClassToClear     = nClass;
                                                    nChosenSpellLevel = nSpellLevel;
                                                    nChosenSpellId    = nSpellId;
                                                    bMemorised        = FALSE;
                                                    bDoneClass        = TRUE;
                                                }
                                            }
                                        }
                                    }
                                }
                                // Else know all spells just loop them all
                                // This might TMI we we should probably just cache this sometime.
                                else
                                {
                                    int nBestSpellLevel = -1, nBestSpellId;
                                    int nSpellId, nRowCount = Get2DARowCount("spells");
                                    for (nSpellId = 0; nSpellId < nRowCount; nSpellId++)
                                    {
                                        int nLevel = GetSpellLevelByClass(nClass, nSpellId);

                                        if (nLevel >= 0)
                                        {
                                            if (GetSpellUsesLeft(oTarget, nClass, nSpellId) > 0)
                                            {
                                                if (nLevel > nBestSpellLevel)
                                                {
                                                    nBestSpellLevel = nLevel;
                                                    nBestSpellId    = nSpellId;
                                                    // Max spell slot? stop early
                                                    if (nLevel >= 9)
                                                    {
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    // Use what we found - potentially
                                    if (nBestSpellLevel > nChosenSpellLevel)
                                    {
                                        bMemorised        = FALSE;
                                        bDoneClass        = TRUE;
                                        nClassToClear     = nClass;
                                        nChosenSpellLevel = nBestSpellLevel;
                                        nChosenSpellId    = nBestSpellId;
                                    }
                                }
                            }
                        }
                    }
                }

                // Got any?
                if (nChosenSpellLevel >= 0)
                {
                    if (bMemorised)
                    {
                        int nIndex;
                        int nSpellInSlot;
                        for (nIndex = 0; !bDoneClass && nIndex < GetMemorizedSpellCountByLevel(oTarget, nClassToClear, nChosenSpellLevel); nIndex++)
                        {
                            if (GetMemorizedSpellReady(oTarget, nClassToClear, nChosenSpellLevel, nIndex) == TRUE)
                            {
                                nSpellInSlot = GetMemorizedSpellId(oTarget, nClassToClear, nChosenSpellLevel, nIndex);
                                SetMemorizedSpellReady(oTarget, nClassToClear, nChosenSpellLevel, nIndex, FALSE);
                                SendMessageToPC(oCaster, "*Blackstaff removed a level " + IntToString(nChosenSpellLevel) + " spell slot with " + GetSpellName(nSpellInSlot) + " in it from the targets " + GetClassName(nClassToClear) + " class spellbook*");
                                SendMessageToPC(oTarget, "*Blackstaff removed a level " + IntToString(nChosenSpellLevel) + " spell slot with " + GetSpellName(nSpellInSlot) + " in it from the your " + GetClassName(nClassToClear) + " class spellbook*");
                                break;
                            }
                        }
                    }
                    else
                    {
                        int nLeft = GetSpellUsesLeft(oTarget, nClassToClear, nChosenSpellId);
                        if (nLeft > 0)
                        {
                            ReadySpellLevel(oTarget, nChosenSpellLevel, nClassToClear, -1);
                            SendMessageToPC(oCaster, "*Blackstaff removed a level " + IntToString(nChosenSpellLevel) + " spell slot from the targets " + GetClassName(nClassToClear) + " class spellbook*");
                            SendMessageToPC(oTarget, "*Blackstaff removed a level " + IntToString(nChosenSpellLevel) + " spell slot from your " + GetClassName(nClassToClear) + " class spellbook*");
                        }
                    }
                }
            }
        }
    }
}
