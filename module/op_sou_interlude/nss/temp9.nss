void main()
{
    object oWP = GetWaypointByTag("Q2_START");
    SetLocalObject(GetModule(), "X1_CURRENT_START", oWP);
}
