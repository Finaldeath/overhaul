//::///////////////////////////////////////////////
//:: Petrification Spells
//:: op_s_petrify
//:://////////////////////////////////////////////
/*
    Petrification spells and abilities. Due to the EffectPetrify being usually
    applied permanently (meaning game-ending if it happens in singleplayer) we
    work in all the gizmos and doodads Bioware did and some of our own in one
    place.

    Flesh to Stone
    Single target, the effect is permanent (and magical) or non-permanent if target
    is a PC and it's under hardcore rules.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink = EffectLinkEffects(EffectPetrify(), EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

    // Toggles
    int nImpact = VFX_NONE, nVis = VFX_NONE;

    // If set to FALSE it doesn't do resist spell checks.
    int bMagical = TRUE;

    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;

    switch (nSpellId)
    {
        case SPELL_FLESH_TO_STONE:
        {
            bMagical = TRUE;
        }
        break;
        default:
        {
            Debug("[op_s_petrify] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if (!GetIsImmuneToPetrificationWithFeedback(oTarget))
        {
            if (bMagical == FALSE || !DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                {
                    if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));

                    // The duration is permanent against NPCs but only temporary against PCs
                    if (GetIsPC(oTarget))
                    {
                        // Calculate Duration based on difficulty settings
                        switch (GetGameDifficulty())
                        {
                            case GAME_DIFFICULTY_VERY_EASY:
                            case GAME_DIFFICULTY_EASY:
                            case GAME_DIFFICULTY_NORMAL:
                            {
                                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
                            }
                            break;
                            default:
                                // GAME_DIFFICULTY_CORE_RULES
                                // GAME_DIFFICULTY_DIFFICULT
                            {
                                // Under hardcore rules or higher, this is an instant death
                                ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);
                                DelayCommand(2.75, PopUpDeathGUIPanel(oTarget, FALSE , TRUE, 40579)); // "You have been turned to stone."
                            }
                            break;
                        }
                    }
                    else
                    {
                        ApplySpellEffectToObject(DURATION_TYPE_PERMANENT, eLink, oTarget);

                        // AA - to fix later if this is still an issue (can petrified people really be moved?)

                        //----------------------------------------------------------
                        // GZ: Fix for henchmen statues haunting you when changing
                        //     areas. Henchmen are now kicked from the party if
                        //     petrified.
                        //----------------------------------------------------------
                        // (GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN)
                        //{
                        //    FireHenchman(GetMaster(oTarget),oTarget);
                        //}

                    }
                    // April 2003: Clearing actions to kick them out of conversation when petrified
                    AssignCommand(oTarget, ClearAllActions(TRUE));
                }
            }
        }
    }
}

