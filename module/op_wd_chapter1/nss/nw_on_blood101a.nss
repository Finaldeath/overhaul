void main()
{
    if ( (GetDistanceToObject(GetLastPerceived()) < 20.0) && (GetLocalInt(OBJECT_SELF,"BloodMovedToVasco")==0))
    {
        if (GetIsPC(GetLastPerceived()) == TRUE)
        {
            ActionMoveToObject(GetWaypointByTag("WayBloodSail2"));
        }
    }
}
