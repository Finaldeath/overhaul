//Shadowguard cutscene abort

void main()
{
    object oPC = GetLastPCToCancelCutscene();

    //If it's the final area...
    object oArea = GetArea(oPC);
    string sArea = GetTag(oArea);

    if (sArea == "TheVoyager")
    {
        //Pop up the gui panel
            FadeToBlack(oPC, FADE_SPEED_FASTEST);
            DelayCommand(0.5f, EndGame("dd_sg_credits"));
    }
}
