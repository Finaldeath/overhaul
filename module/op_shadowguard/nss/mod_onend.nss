void main()
{
    object oPC = GetPCSpeaker();

    FadeToBlack(oPC, FADE_SPEED_FAST);

    ExportSingleCharacter(oPC);

    EndGame("");
}
