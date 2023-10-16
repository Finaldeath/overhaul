//act_q1hkobold_1
//PC snatches baby from kobold
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nBabyPlotBabySaved") != 1)
    {
        object oKobold = GetObjectByTag("q1h2_kblake");
        object oBaby = GetItemPossessedBy(oKobold, "q1hbaby");
        object oDialog = GetObjectByTag("q1hdialog");

        SetLocalInt(oDialog, "nBabyPlotBabySaved", 1);
        SetLocalInt(oKobold, "nBabyPlotBabySaved", 1);

        if (GetIsObjectValid(oBaby) == TRUE)
            DestroyObject(oBaby);
        CreateItemOnObject("q1hbaby", GetPCSpeaker());

        SetLocalInt(GetModule(), "X1_PCRescuedQ1HBaby", 1);
        SetLocalInt(oKobold, "nBabyMessage", 1);
        SetLocalInt(oKobold, "nCharmed", 1);
    }

}
