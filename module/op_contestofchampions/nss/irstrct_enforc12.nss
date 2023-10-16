#include "inc_module"

int StartingConditional()
{
    if ( GetNumTeams() != 3 )
    {
        return TRUE;
    }

    return FALSE;
}
