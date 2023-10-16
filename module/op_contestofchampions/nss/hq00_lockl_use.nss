#include "inc_module"

void main()
{
    object oPlayer;
    int nTeam;

    oPlayer = GetLastUsedBy();
    nTeam = GetPlayerTeam(oPlayer);

    if ( GetLocalInt(OBJECT_SELF,"m_bActivated") == TRUE )
    {
        if ( GetGameStarted() == TRUE )
        {
            SpeakOneLinerConversation("hq00_lockswitch");
            return;
        }

        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF,"m_bActivated",FALSE);
        SetTeamLocked(nTeam,FALSE);
        RemoveLockedEffect(OBJECT_SELF);
    }
    else
    {
        if ( GetPlayerCheckedIn(oPlayer) == FALSE )
        {
            SpeakOneLinerConversation("hq00_lockcheck");
            return;
        }

        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF,"m_bActivated",TRUE);
        SetTeamLocked(nTeam,TRUE);
        ApplyLockedEffect(OBJECT_SELF);
    }
}
