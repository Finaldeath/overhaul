//::///////////////////////////////////////////////
//:: Illithid Initiates
//:: q3_init_illithi2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The illithid initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void EffectRegen (object oTarget);
void EffectACInc (object oTarget);

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oHen1 = GetHenchman(oPC, 1);
    object oHen2 = GetHenchman(oPC, 2);

    object oAnimalComp = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

    object oIllithid = GetNearestObjectByTag("q3_illithid");
    object oIntelDev1 = GetNearestObjectByTag("Q3_FINALFGT_INTELDEV", oIllithid, 1);
    object oIntelDev2 = GetNearestObjectByTag("Q3_FINALFGT_INTELDEV", oIllithid, 2);

    object wpPC = GetWaypointByTag("q3_way_pc");
    object wpHen1 = GetWaypointByTag("q3_way_hen1");
    object wpHen2 = GetWaypointByTag("q3_way_hen2");
    object oDoor = GetObjectByTag("q3_illithiddr");

    if((GetIsPC(oPC) == TRUE) && (os_CheckTriggerEntered() == FALSE))
    {
        os_SetTriggerEntered();

        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, SetCommandable(FALSE, oPC));

        AssignCommand(oAnimalComp, ActionForceMoveToLocation(GetLocation(wpPC), TRUE, 4.5f));
        AssignCommand(oFamiliar, ActionForceMoveToLocation(GetLocation(wpPC), TRUE, 4.5f));
        AssignCommand(oSummoned, ActionForceMoveToLocation(GetLocation(wpPC), TRUE, 4.5f));

        AssignCommand(oPC, ActionForceMoveToLocation(GetLocation(wpPC), TRUE, 5.0f));
        AssignCommand(oHen1, ActionForceMoveToLocation(GetLocation(wpHen1), TRUE, 5.0f));
        AssignCommand(oHen2, ActionForceMoveToLocation(GetLocation(wpHen2), TRUE, 5.0f));

        DelayCommand(1.0f, AssignCommand(oIntelDev1, ActionCastFakeSpellAtObject(SPELL_PREMONITION, oIllithid)));
        DelayCommand(1.0f, AssignCommand(oIntelDev2, ActionCastFakeSpellAtObject(SPELL_REGENERATE, oIllithid)));

        DelayCommand(1.7f, AssignCommand(oIntelDev1, EffectACInc(oIllithid)));
        DelayCommand(1.7f, AssignCommand(oIntelDev2, EffectRegen(oIllithid)));
        DelayCommand(2.2f, AssignCommand(oIntelDev1, EffectACInc(oIntelDev1)));
        DelayCommand(2.2f, AssignCommand(oIntelDev2, EffectRegen(oIntelDev2)));

        DelayCommand(2.5f, AssignCommand(oIllithid, SpeakString("''You have come right to me, like a pathetic fool, scum! Today I rise and you shall die...'' It seems strange to see your adversary without his mask but you know beyond a shadow of a doubt that it is him. If nothing else, you recognize the voice.")));
        DelayCommand(2.5f, AssignCommand(oPC, PlaySound("km1_masked020")));

        DelayCommand(6.5f, AssignCommand(oHen1, JumpToLocation(GetLocation(wpHen1))));
        DelayCommand(6.5f, AssignCommand(oHen2, JumpToLocation(GetLocation(wpHen2))));
        DelayCommand(6.5f, AssignCommand(oAnimalComp, JumpToLocation(GetLocation(wpPC))));
        DelayCommand(6.5f, AssignCommand(oFamiliar, JumpToLocation(GetLocation(wpPC))));
        DelayCommand(6.5f, AssignCommand(oSummoned, JumpToLocation(GetLocation(wpPC))));

        DelayCommand(7.0f, ChangeToStandardFaction(oIllithid, STANDARD_FACTION_HOSTILE));
        DelayCommand(7.0f, ChangeToStandardFaction(oIntelDev1, STANDARD_FACTION_HOSTILE));
        DelayCommand(7.0f, ChangeToStandardFaction(oIntelDev2, STANDARD_FACTION_HOSTILE));
        DelayCommand(7.0f, AssignCommand(oPC, SetCommandable(TRUE, oPC)));

        DelayCommand(7.0f, AssignCommand(oDoor, ActionCloseDoor(OBJECT_SELF)));
        DelayCommand(7.0f, AssignCommand(oDoor, SetLocked(OBJECT_SELF, TRUE)));

        DelayCommand(7.7f, AssignCommand(oIllithid, ActionAttack(oPC)));
    }
}

void EffectRegen (object oTarget)
{
    effect eEffectRGN = EffectRegenerate(4, 3.0f);
    effect eEffectVFXRGN = EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffectRGN, oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffectVFXRGN, oTarget);
}

void EffectACInc (object oTarget)
{
    effect eEffectAC = EffectACIncrease(5);
    effect eEffectSave = EffectSavingThrowIncrease(SAVING_THROW_ALL, 5);
    effect eEffectVFXAC = EffectVisualEffect(VFX_DUR_PROT_PREMONITION);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffectAC, oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffectSave, oTarget);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffectVFXAC, oTarget);
}
