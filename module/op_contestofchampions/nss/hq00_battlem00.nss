#include "inc_module"

void main()
{
    object oPlayer;

    oPlayer = GetPCSpeaker();

    if ( GetGameStarted() == FALSE )
    {
        CheckPlayerIn(oPlayer);
    }
}
