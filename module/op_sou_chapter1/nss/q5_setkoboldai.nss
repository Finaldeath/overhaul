void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        object oShooter1 = GetObjectByTag("Q5_KOBOLD_BARREL", 0);
        object oShooter2 = GetObjectByTag("Q5_KOBOLD_BARREL", 1);
        SetAILevel(oShooter1, AI_LEVEL_HIGH);
        SetAILevel(oShooter2, AI_LEVEL_HIGH);
    }
}
