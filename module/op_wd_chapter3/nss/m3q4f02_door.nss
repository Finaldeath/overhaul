// * Gold Dragon attacks anyone who tries or does open
// * the door
#include "NW_I0_GENERIC"

void main()
{
    if(!GetIsDead(GetNearestObjectByTag("M3Q04F02GORGELC")))
    {
        ChangeToStandardFaction(GetNearestObjectByTag("M3Q04F02GORGELC"),STANDARD_FACTION_HOSTILE);
        AssignCommand(GetNearestObjectByTag("M3Q04F02GORGELC"), DetermineCombatRound());
    }
}
