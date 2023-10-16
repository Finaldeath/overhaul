//////////////////////////////////////////////////////////////
// inc_hq :: Default Include file for headquarter area specific
//           scripting.
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
//////////////////////////////////////////////////////////////

void SetNumTeamMarkers( int nTeam, int nNumMarkers );
int GetNumTeamMarkers( int nTeam );

//////////////////////////////////////////////////////////////
// SetNumTeamMarkers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Sets the number of team markers of the
//              specified team. This function should only ever
//              be run in the HQ area specific scripts.
//////////////////////////////////////////////////////////////
void SetNumTeamMarkers( int nTeam, int nNumMarkers )
{
    string sVarName;

    sVarName = "m_nTeam" + IntToString(nTeam) + "Markers";
    SetLocalInt(OBJECT_SELF,sVarName,nNumMarkers);
}

//////////////////////////////////////////////////////////////
// GetNumTeamMarkers()
//////////////////////////////////////////////////////////////
// Created By: Brenon Holmes
// Created On: Jun/10/02
// Description: Returns the number of team markers of the
//              specified team.
//////////////////////////////////////////////////////////////
int GetNumTeamMarkers( int nTeam )
{
    string sVarName;

    sVarName = "m_nTeam" + IntToString(nTeam) + "Markers";
    return GetLocalInt(OBJECT_SELF,sVarName);
}
