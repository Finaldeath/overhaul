#include "inc_module"

void main()
{
    object oUsedBy;
    oUsedBy = GetLastUsedBy();

    if ( GetLocalInt(oUsedBy,"m_bAddGoldOnAreaJoin") == TRUE )
    {
        return;
    }

    if ( ValidatePlayer(oUsedBy) == VALIDATE_PLAYER_SUCCESS )
    {
        RemoveAllGoldFromPlayer(oUsedBy);
        SetLocalInt(oUsedBy,"m_bAddGoldOnAreaJoin",TRUE);
        InitializePlayerForGame(oUsedBy);
        MovePlayerToStartLocation(oUsedBy);
    }
    else
    {
        SpeakOneLinerConversation();
    }
}
