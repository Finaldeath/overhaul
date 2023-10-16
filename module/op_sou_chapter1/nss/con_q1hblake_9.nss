int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBaby = GetItemPossessedBy(oPC, "q1hbaby");
    if (GetIsObjectValid(oBaby) == FALSE && GetLocalInt(GetModule(), "X1_PCRescuedQ1HBaby") == 1 && GetLocalInt(GetModule(),"X1_NORAHASBABY") != 1  && GetLocalInt(GetModule(), "X1_Q1HBabyInCrib") != 1)
    {

        return TRUE;
    }
    return FALSE;
}
