// Spec leaves party

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        if(GetTag(oHench) == "q5_spec")
        {
            object oWP = GetWaypointByTag("q5a_spec_wait");
            RemoveHenchman(oPC, oHench);
            AssignCommand(oHench, ClearAllActions());
            AssignCommand(oHench, ActionMoveToObject(oWP, TRUE));
        }
        i++;
        oHench = GetHenchman(oPC, i);
    }

}
