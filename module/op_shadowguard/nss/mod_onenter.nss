#include "help_hench"
#include "help_general"

void GreaterRestore(object oHench)
{
    //Declare major variables
    object oTarget = oHench;
    effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
        if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL ||
            GetEffectType(eBad) == EFFECT_TYPE_FRIGHTENED ||
            GetEffectType(eBad) == EFFECT_TYPE_DAZED ||
            GetEffectType(eBad) == EFFECT_TYPE_CONFUSED ||
            GetEffectType(eBad) == EFFECT_TYPE_POISON ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE)
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
}

void DestroyObjects(object oPC)
{
    object o = GetFirstItemInInventory(oPC);

    int i;

    i = GetGold(oPC);

    object oTake = GetObjectByTag("CT_UNIQ_NT_ETSP");

    AssignCommand(oTake, TakeGoldFromCreature(i, oPC, TRUE));

    while (o != OBJECT_INVALID)
    {
        DestroyObject(o);

        o = GetNextItemInInventory(oPC);
    }

    for (i = 0; i < NUM_INVENTORY_SLOTS; i++)
    {
        o = GetItemInSlot(i, oPC);
        DestroyObject(o);
    }
}

void SetUpCustomTokens(object oPC)
{
    if (GetGender(oPC) == GENDER_MALE)
    {
        SetCustomToken(6001, "son");
        SetCustomToken(6002, "Son");
        SetCustomToken(6003, "Jalen");  // False name used at points in module
        SetCustomToken(6004, "chap");
    }

    else
    {
        SetCustomToken(6001, "daughter");
        SetCustomToken(6002, "Daughter");
        SetCustomToken(6003, "Jayla");  // False name used at points in module
        SetCustomToken(6004, "lassie");
    }

    // "Stormcrow" family name (can be changed later if need be
    SetCustomToken(6020, "Stormcrow");
}

void RestartCutscene(object oPC)
{
    if (GetLocalString(oPC, "N_CURR_CUTSCENE") != "")
        AssignCommand(oPC, ActionStartConversation(oPC, GetLocalString(oPC, "S_CURR_CUTSCENE"), TRUE, FALSE));
}

void CreateBeginningGear(object oPC)
{

}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            //AddJournalQuestEntry("MODULE_CREDITS", 1, oPC);

            GreaterRestore(oPC);
            if (GetLocalInt(GetModule(), "N_TEST") != 1)
                SetXP(oPC, 3000);

            DestroyObjects(oPC);
            GiveGoldToCreature(oPC, 1000);
            CreateBeginningGear(oPC);

            int nLevel = GetHitDice(oPC);

            int i;

            // In case PC comes in at higher level than 1, should Level Up all Henchmen
            for (i = 1; i < nLevel; i++)
                LevelUpAllHenchmen(oPC);

            SpawnAllHenchmen(oPC);

            // Set up which version of Okaris will be created
            int nOkaris;

            switch (GetRacialType(oPC))
            {
                case RACIAL_TYPE_HUMAN:
                    nOkaris = 1;
                    break;

                case RACIAL_TYPE_HALFELF:
                    nOkaris = 1;
                    break;

                case RACIAL_TYPE_ELF:
                    nOkaris = 2;
                    break;

                case RACIAL_TYPE_DWARF:
                    nOkaris = 3;
                    break;

                case RACIAL_TYPE_GNOME:
                    nOkaris = 4;
                    break;

                case RACIAL_TYPE_HALFLING:
                    nOkaris = 5;
                    break;

                case RACIAL_TYPE_HALFORC:
                    nOkaris = 6;
                    break;

                // default shouldn't be able to happen, but make Human just in case
                default:
                    nOkaris = 1;
                    break;
            }

            SetLocalInt(GetModule(), "N_OKARIS_RACE", nOkaris);
            SetUpCustomTokens(oPC);

            // if (GetLocalInt(GetModule(), "N_TEST") == 1)
            //    CreateItemOnObject("IT_PLOT_999", oPC);

        }

        SetCommandable(TRUE, oPC);
        RestartCutscene(oPC);
    }
}
