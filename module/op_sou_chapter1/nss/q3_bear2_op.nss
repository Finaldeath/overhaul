// open event for bears cage door. If open - have the bears exit to the corridor.
// if the chief's hall door is also open - have the bears charge into the hall.

void main()
{
    object oWP1 = GetWaypointByTag("Q3A_WP_BEARS1");
    object oWP2 = GetWaypointByTag("Q3A_WP_BEARS2");
    int i;
    object oBear;
    object oDoor = GetNearestObjectByTag("Q3_SIDE2");
    int nOpen = GetLocalInt(oDoor, "OPEN");
    float fDelay = 0.0;
    for(i = 1; i <=3; i++)
    {
        fDelay += 1.0;
        oBear = GetNearestObjectByTag("NW_BEARBLCK", OBJECT_SELF, i);
        if(oBear == OBJECT_INVALID)
            return;
        DelayCommand(fDelay, AssignCommand(oBear, ClearAllActions()));
        DelayCommand(fDelay, AssignCommand(oBear, ActionMoveToObject(oWP1, TRUE)));
        SetLocalInt(oBear, "IGNORE_HB", 1);
        if(nOpen == 1) // if the door to the chief's hall is also open - let the bears charge!
        {
            // make sure the bears hate the chief and his buddies
            object oChief = GetNearestObjectByTag("Q3_CHIEF_GISHNAK");
            if(oChief != OBJECT_INVALID)
            {
                int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_REP_ONCE");
                if(nDoOnce == 0)
                    SetLocalInt(OBJECT_SELF, "DO_REP_ONCE", 1);
                else
                {
                    AdjustReputation(oChief, oBear, -100);
                    AdjustReputation(oBear, oChief, -100);
                }
            }
            DelayCommand(fDelay + 0.5, AssignCommand(oBear, ActionMoveToObject(oWP2, TRUE)));
        }
    }
}
