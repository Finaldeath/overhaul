#include "inc_validate"

void main()
{
    object oPlayer;
    int nRequiredLevel, nRequiredXP, nXPDelta;

    oPlayer = GetPCSpeaker();

    nRequiredLevel = GetAllowedLevelForPlayer(oPlayer);
    nRequiredXP = GetXPRequiredForLevel(nRequiredLevel);

    nXPDelta = nRequiredXP - GetXP(oPlayer);
    if ( nXPDelta <= 0 )
    {
        SetXP(oPlayer,nRequiredXP);
    }
    else
    {
        GiveXPToCreature(oPlayer,nXPDelta);
    }
}
