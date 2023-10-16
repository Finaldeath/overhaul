#include "inc_module"

void main()
{
    object oPlayer;
    string sName;

    oPlayer = GetBattleMaster();
    sName = GetName(oPlayer);

    SetCustomToken(500,sName);
}
