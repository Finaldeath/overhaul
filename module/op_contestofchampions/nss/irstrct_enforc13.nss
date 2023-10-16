#include "inc_module"

int StartingConditional()
{
    if ( GetNumTeams() != 4 )
    {
        return TRUE;
    }

    return FALSE;
}
