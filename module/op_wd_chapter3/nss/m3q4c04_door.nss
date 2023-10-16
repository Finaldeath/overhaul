// * Green Dragon attacks anyone who tries or does open
// * the door
#include "NW_I0_GENERIC"

void main()
{
    if(!GetIsDead(GetNearestObjectByTag("M3Q04C03AKUL")))
    {
        ChangeToStandardFaction(GetNearestObjectByTag("M3Q04C03AKUL"),STANDARD_FACTION_HOSTILE);
        AssignCommand(GetNearestObjectByTag("M3Q04C03AKUL"), DetermineCombatRound());
    }
}
