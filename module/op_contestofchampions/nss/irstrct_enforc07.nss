#include "inc_rules"

void main()
{
    object oPlayer;
    int nAllowedLevel;

    oPlayer = GetPCSpeaker();

    nAllowedLevel = GetAllowedLevelForPlayer(oPlayer,TRUE);
    if ( nAllowedLevel == LEVEL_LIMIT_NONE )
    {
        SetCustomToken(500,"Unlimited");
    }
    else
    {
        SetCustomToken(500,IntToString(nAllowedLevel));
    }
}
