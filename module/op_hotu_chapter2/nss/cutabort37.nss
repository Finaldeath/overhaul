// Armand appearance abort script

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    object oArmand = GetObjectByTag("q3_armand2");
    object oArmandSP = GetWaypointByTag("q3c_wp_armand_sp");
    DelayCommand(2.0, AssignCommand(oArmand, JumpToObject(oArmandSP)));
    AdjustReputation(oArmand, oPC, -100);
    AdjustReputation(oPC, oArmand, -100);
    SignalEvent(oArmand, EventUserDefined(101));
}
