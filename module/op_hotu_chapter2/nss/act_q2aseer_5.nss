//::///////////////////////////////////////////////
//:: Name act_q2aseer_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC to the start of battle 3 - outside
    the Matron's fortress
    Win the siege scenario:

    Set the module var “X2_ENDING_STATUS” to 2

    AND

    Jump the player to the following waypoint: “q7a_wp_camera1”

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 12/03
//:://////////////////////////////////////////////

void main()
{
    //Set Battle 2 as over
    SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 2);
    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 2);

    object oPC = GetPCSpeaker();

    // removing all henchmen
    //int i = 1;
    object oHench = GetHenchman(oPC);
    while(oHench != OBJECT_INVALID)
    {
        RemoveHenchman(oPC, oHench);
        AssignCommand(oHench, ClearAllActions(TRUE));
        //i++;
        oHench = GetHenchman(oPC);
    }
    /*
    //Battle 2 Over variables
    //If Deekin is with the player when triggering the final cutscene then:
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oDeekin)) == TRUE)
        {
            SetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE", 1);
            ForceRest(oDeekin);
        }

    }

    object oValen = GetObjectByTag("x2_hen_valen");
    if (GetIsObjectValid(oValen) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oValen)) == TRUE)
        {
            ForceRest(oValen);
        }

    }

    object oNath = GetObjectByTag("x2_hen_nathyra");
    if (GetIsObjectValid(oNath) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oNath)) == TRUE)
        {
            ForceRest(oNath);
        }

    }*/
    object oTarget = GetWaypointByTag("q7a_wp_camera1");
    ForceRest(oPC);


     //Remove immobalize (and polymorph) and jump PC to outside the Matron's fortress cutscene
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE ||
            GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));
}
