//toughs leave the bar
void main()
{
    object oTough1 = GetObjectByTag("q2abartough1");
    object oTough2 = GetObjectByTag("q2abartough2");

    object oDoor = GetWaypointByTag("wp_svirfdrinkend");
    AssignCommand(oTough1, ActionMoveToObject(oDoor));
    DelayCommand(4.5, SetPlotFlag(oTough1, FALSE));
    DestroyObject(oTough1, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oTough1));

    AssignCommand(oTough2, ActionMoveToObject(oDoor));
    DelayCommand(4.5, SetPlotFlag(oTough2, FALSE));
    DestroyObject(oTough2, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oTough2));

    //2 point good shift added
    object oPC = GetPCSpeaker();
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 2);


}
