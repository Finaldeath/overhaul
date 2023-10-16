//::///////////////////////////////////////////////
//:: Name act_q2aevil_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 1 is over - The PC has betrayed the rebels
    and will now head the attack against the seer.
    Jump the PC to the City Core for Battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 3/03
//:://////////////////////////////////////////////
void JumpPCToBattle2();
void main()
{
        SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);


        SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);


        JumpPCToBattle2();
}
void JumpPCToBattle2()
{
    object oTarget = GetWaypointByTag("wp_q2abattle2_evilstart");
    effect eEffect;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC) == TRUE)
    {
        SetLocalInt(oPC, "X2_Q2ABattle1Won", 1);
        //Remove immobalize effect from PC (from end of battle conversation)
        eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
                RemoveEffect(oPC, eEffect);
            eEffect = GetNextEffect(oPC);
        }
        //AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, JumpToObject(oTarget));
        oPC = GetNextPC();
    }
}

