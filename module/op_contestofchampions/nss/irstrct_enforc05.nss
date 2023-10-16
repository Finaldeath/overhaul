#include "inc_rules"

void main()
{
    object oPlayer;
    int nPlayerLevel;

    oPlayer = GetPCSpeaker();

    nPlayerLevel = GetTotalPlayerLevel(oPlayer);
    SetCustomToken(500,IntToString(nPlayerLevel));
}
