//q2d8_endgame
//End the game as the PC has decided to stay forever in dreamland.

void main()
{
    object oPC = GetPCSpeaker();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);
    FadeToBlack(oPC);
    DelayCommand(3.0, EndGame("XP2_Closing"));
}
