#include "help_conv"

void main()
{
    int FACTION_EVERGREEN = 1;
    int FACTION_SHARAKIN = 2;
    int FACTION_AVORIEL = 3;

    ModFactionValue(GetPCSpeaker(), FACTION_AVORIEL, 10);
}
