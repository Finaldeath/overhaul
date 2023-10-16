void main()
{
    object oPC = GetPCSpeaker();

    // Cast for cutscene
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");
    object oMarkius = GetNearestObjectByTag("HENCH_MARK");
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    object oKara = GetNearestObjectByTag("HENCH_KARA");
    object oBrukus = GetNearestObjectByTag("HENCH_BRUK");
    object oTarin = GetNearestObjectByTag("HENCH_TARI");

    // EXTRA CODE BELOW
    object o;

    AssignCommand(oMarkius, ActionMoveToObject(oCP, TRUE, 2.0));
    AssignCommand(oLyen, ActionMoveToObject(oCP, TRUE, 2.0));
    AssignCommand(oKara, ActionMoveToObject(oCP, TRUE, 2.0));
    AssignCommand(oTarin, ActionMoveToObject(oCP, TRUE, 2.0));
    AssignCommand(oBrukus, ActionMoveToObject(oCP, TRUE, 2.0));

}
