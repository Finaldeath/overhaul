//::///////////////////////////////////////////////
//:: Name cutabort113
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of betrayal and the Seer's Death
    Jump to Matron
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 9/03
//:://////////////////////////////////////////////
void JumpPCToMatron();

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    BlackScreen(oPC);
    FadeFromBlack(oPC, FADE_SPEED_FAST);

    JumpPCToMatron();
}

void JumpPCToMatron()
{
    /*
    Betray the rebels scenario:
    Set the module var “X2_ENDING_STATUS” to 1
    AND
    Jump the player to the following waypoint: “q7b_wp_camera1”
    */
    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 1);
    //Battle 2 Over variables
    //If Deekin is with the player when triggering the final cutscene then:
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oDeekin)) == TRUE)
            SetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE", 1);
    }
        // remove all other henchmen
    object oPC = GetFirstPC();
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        if(GetTag(oHench) != "x2_hen_deekin")
            DelayCommand(1.0, RemoveHenchman(oPC, oHench));
        else // Deekin
        {
           ForceRest(oDeekin);
            effect eEffect = GetFirstEffect(oDeekin);
            while (GetIsEffectValid(eEffect))
            {
                RemoveEffect(oDeekin, eEffect);
                eEffect = GetNextEffect(oDeekin);
            }
        }
        i++;
        oHench = GetHenchman(oPC, i);
    }


    object oTarget = GetObjectByTag("q7b_wp_camera1");
    //Remove immobalize (and polymorph) and jump PC to outside the Matron's fortress cutscene
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE ||
            GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }

    while (GetIsObjectValid(oPC) == TRUE)
    {
        ForceRest(oPC);
        DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oTarget)));
        oPC = GetNextPC();
    }
}
