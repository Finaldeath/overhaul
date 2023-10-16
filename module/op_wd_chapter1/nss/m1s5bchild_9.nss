void WalkWayPoints(int nRun, float fPause);
void RunCircuit(int nTens, int nNum, int nRun, float fPause);
void RunNextCircuit(int nRun, float fPause);

void main()
{
    WalkWayPoints(TRUE,12.0);
}

void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)  //Run first circuit
{
      int nNth = 1;
        int nTens;
        int nNum;
        object oNearest = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, nNth);
        while (GetIsObjectValid(oNearest))
        {
           string sNearestTag = GetTag(oNearest);
           //removes the first 3 and last three characters from the waypoint's tag
           //and checks it against his own tag.  Waypoint tag format is WP_MyTag_XX.
           if( GetSubString( sNearestTag, 3, GetStringLength( sNearestTag ) - 6 ) == GetTag( OBJECT_SELF ) )
           {
                string sTens = GetStringRight(GetTag(oNearest),2);
                nTens = StringToInt(sTens)/10;
                nNum= StringToInt(GetStringRight(GetTag(oNearest),1));
                oNearest = OBJECT_INVALID;
           }
           else
           {
               nNth++;
               oNearest = GetNearestObject(OBJECT_TYPE_WAYPOINT,OBJECT_SELF,nNth);
           }
        }
        RunCircuit(nTens, nNum, nRun, fPause);
        ActionDoCommand(RunNextCircuit(nRun, fPause));
        //ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(2)));
}

void RunNextCircuit(int nRun = FALSE, float fPause = 1.0)
{
    RunCircuit(0,1, nRun, fPause);
    ActionDoCommand(RunNextCircuit(nRun, fPause));
    //ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(2)));
}

//::///////////////////////////////////////////////
//:: Run Circuit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calculates the proper path to follow along a
    predetermined set of way points
*/
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan
//:: Created On: July 10, 2001
//:://////////////////////////////////////////////

void RunCircuit(int nTens, int nNum, int nRun = FALSE, float fPause = 1.0)
{
    // starting at a given way point, move sequentialy through incrementally
    // increasing points until there are no more valid ones.
    object oTargetPoint = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));

    while(GetIsObjectValid(oTargetPoint))
    {
        ActionWait(fPause);
        ActionMoveToObject(oTargetPoint, nRun);
        ActionDoCommand(SetFacing(180.0));
        nNum++;
        if (nNum > 9)
        {
            nTens++;
            nNum = 0;
        }
        oTargetPoint = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
    }
    // once there are no more waypoints available, decriment back to the last
    // valid point.
    nNum--;
    if (nNum < 0)
    {
        nTens--;
        nNum = 9;
    }

    // start the cycle again going back to point 01
    oTargetPoint = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
    while(GetIsObjectValid(oTargetPoint))
    {
        ActionWait(fPause);
        ActionMoveToObject(oTargetPoint, nRun);
        ActionDoCommand(SetFacing(180.0));
        nNum--;
        if (nNum < 0)
        {
            nTens--;
            nNum = 9;
        }
        oTargetPoint = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
    }
}
