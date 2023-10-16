#include "inc_module"

void main()
{
    object oPlayer;

    oPlayer = GetLastPCRested();

    CheckPlayerOut(oPlayer);
}
