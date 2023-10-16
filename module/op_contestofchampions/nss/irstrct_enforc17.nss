#include "inc_module"

void main()
{
    int nNumTeams;

    nNumTeams = GetNumTeams();
    SetCustomToken(500,IntToString(nNumTeams));
}
