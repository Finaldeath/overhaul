#include "inc_module"

int StartingConditional()
{
    if ( GetNumTeams() > 2 )
    {
        return TRUE;
    }

    return FALSE;
}
