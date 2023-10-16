//::///////////////////////////////////////////////
//:: Name act_q2aherald_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 1 is over - jump the herald and the PC
    to the City Core for Battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////
void JumpPCToBattle2();
void main()
{
    object oPC = GetPCSpeaker();

    // THE BELOW VAR SETTINGS HAVE BEEN MOVED TO act_q2aherald_4a

    /*//Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 0);

    SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);


    SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);*/
    object oHerald = OBJECT_SELF;
    object oHeraldStart = GetWaypointByTag("wp_q2abattle2_herald_lossstart");
    AssignCommand(oHerald, JumpToObject(oHeraldStart));


    JumpPCToBattle2();
}
void JumpPCToBattle2()
{
    SetLocalInt(GetModule(), "X2_Q2ABattle1Won", 2);
    effect eEffect;

    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        //Remove immobalize effect from PC (from end of battle conversation)
        eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
                RemoveEffect(oPC, eEffect);
            eEffect = GetNextEffect(oPC);
        }

        SetLocalInt(oPC, "X2_Q2ABattle1Won", 1);
        //AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oTarget)));
        oPC = GetNextPC();
    }
}

