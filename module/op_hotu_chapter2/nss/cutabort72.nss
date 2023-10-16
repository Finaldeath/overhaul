// abort script for devil killing the player

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    //Run End of Chapter Script
    if (GetLocalInt(GetModule(), "X2_Chapter2EndScript") != 1)
    {
        SetLocalInt(GetModule(), "X2_Chapter2EndScript", 1);
        ExecuteScript("x2_c2_end", oPC);
    }
    DelayCommand(3.0, StartNewModule("XP2_Chapter3"));
}
