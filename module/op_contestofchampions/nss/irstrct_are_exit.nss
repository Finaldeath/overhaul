#include "irstrct_are_inc"

void main()
{
    int nNumPlayers;

    nNumPlayers = DecrementNumPlayers();

    if ( nNumPlayers <= 0 )
    {
        DoAreaCleanUp();
    }
}
