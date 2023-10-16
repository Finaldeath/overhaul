#include "inc_hq"
#include "inc_module"

void main()
{
    int nEventId;
    int nTeam, nNumTeamMarkers;
    object oTeamMarker;
    vector vTeamCountIndicator;
    location lSpawnLocation;
    string sTeamMarker, sTemplateName;

    nEventId = GetUserDefinedEventNumber();

    if ( nEventId >= EVENT_ADD_PLAYER_TO_TEAM &&
         nEventId < EVENT_REMOVE_PLAYER_FROM_TEAM )
    {
        nTeam = nEventId - EVENT_ADD_PLAYER_TO_TEAM;

        // Find the waypoint marker that holds the
        // starting position to spawn the team number
        // markers in at.
        // - BKH - Jun/10/02
        sTeamMarker = "WP" + IntToString(nTeam) + "Count";

        oTeamMarker = GetObjectByTag(sTeamMarker);
        if ( GetIsObjectValid(oTeamMarker) == TRUE )
        {
            nNumTeamMarkers = GetNumTeamMarkers(nTeam);

            vTeamCountIndicator = GetPosition(oTeamMarker);
            vTeamCountIndicator.y += IntToFloat(nNumTeamMarkers - 1) * 1.0f;

            lSpawnLocation = Location(OBJECT_SELF,vTeamCountIndicator,1.0f);

            // templates stored in lowercase (doesn't really matter anyways)
            sTemplateName = "team" + IntToString(nTeam) + "marker";
            CreateObject(OBJECT_TYPE_PLACEABLE,sTemplateName,lSpawnLocation);
            SetNumTeamMarkers(nTeam,nNumTeamMarkers + 1);
        }
    }
    else if ( nEventId >= EVENT_REMOVE_PLAYER_FROM_TEAM &&
              nEventId < EVENT_UNLOCK_LEVER )
    {
        float fBestYValue;
        object oBestObject;
        string sTagName;
        vector vPosition;

        nTeam = nEventId - EVENT_REMOVE_PLAYER_FROM_TEAM;

        sTagName = "Team" + IntToString(nTeam) + "Marker";
        nNumTeamMarkers = GetNumTeamMarkers(nTeam);

        // Iterate through the area looking for the specified
        // tag. Grab each object and look for the object with the
        // largest y value... that's the one we want to kill.
        fBestYValue = 0.0f;
        oTeamMarker = GetFirstObjectInArea();
        while ( GetIsObjectValid(oTeamMarker) == TRUE )
        {
            if ( GetObjectType(oTeamMarker) == OBJECT_TYPE_PLACEABLE &&
                 GetTag(oTeamMarker) == sTagName )
            {
                vPosition = GetPosition(oTeamMarker);
                if ( vPosition.y > fBestYValue )
                {
                    fBestYValue = vPosition.y;
                    oBestObject = oTeamMarker;
                }
            }

            oTeamMarker = GetNextObjectInArea();
        }

        if ( GetIsObjectValid(oBestObject) == TRUE )
        {
            DestroyObject(oBestObject);
            SetNumTeamMarkers(nTeam,nNumTeamMarkers - 1);
        }
    }
    else if ( nEventId == EVENT_UNLOCK_LEVER )
    {
        string sLeverTag;
        object oLever;
        sLeverTag = "TeamLockSwitch";

        PrintString("Received Area Unlock Lever Event. Game must be over.");

        oLever = GetFirstObjectInArea(OBJECT_SELF);
        while ( GetIsObjectValid(oLever) == TRUE )
        {
            if ( GetTag(oLever) == sLeverTag )
            {
                AssignCommand(oLever,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
                SetLocalInt(oLever,"m_bActivated",FALSE);
                RemoveLockedEffect(oLever);
                return;
            }

            oLever = GetNextObjectInArea(OBJECT_SELF);
        }
    }
}
