void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    object oGoodLeader = GetObjectByTag("q4c_CutsceneGoodLeader");
    object oGood1 = GetObjectByTag("q4c_CutsceneGood1");
    object oGood2 = GetObjectByTag("q4c_CutsceneGood2");
    object oGood3 = GetObjectByTag("q4c_CutsceneGood3");

    object oEvilLeader = GetObjectByTag("q4c_CutsceneEvilLeader");
    object oEvil1 = GetObjectByTag("q4c_CutsceneEvil1");
    object oEvil2 = GetObjectByTag("q4c_CutsceneEvil2");
    object oEvil3 = GetObjectByTag("q4c_CutsceneEvil3");

    AdjustReputation(oGoodLeader, oEvilLeader, -50);
    AdjustReputation(oEvilLeader, oGoodLeader, -50);
    AdjustReputation(oPC, oEvilLeader, -50);
    AdjustReputation(oEvilLeader, oPC, -50);
    AdjustReputation(oGoodLeader, oPC, -50);
    AdjustReputation(oPC, oGoodLeader, -50);
}
