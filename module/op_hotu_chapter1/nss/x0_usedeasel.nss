//::///////////////////////////////////////////////
//:: x0_usedeasel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Displays player stats when clicked on.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nTimesDied = GetLocalInt(GetLastUsedBy(), "NW_L_PLAYER_DIED");
    int nKills = GetLocalInt(GetLastUsedBy(), "NW_L_PLAYER_KILLS");
    string sKilled = GetLocalString(GetLastUsedBy(), "NW_L_PLAYER_TOUGHEST_S");
    SpeakString(GetName(GetLastUsedBy()) + " # of Times Died " + IntToString(nTimesDied)
              + "     # of creatures killed " + IntToString(nKills) +
              "       Toughest Creatured Killed " + sKilled);
}
