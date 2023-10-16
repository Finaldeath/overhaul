////Only valid if NW_G_M3Q01PLOTUTHGARDTELKTRIBE !=99
///// (Plot is set to 99 when completed and reward given)


/////Checks if the player has YUSAMSFEATHER, (given when plot first mentioned)
/////or if the Elk Tribe Chieftan is dead
///// or if the player has the ELKCHIEFTOKEN (knows of illness, not cured, not dead)
///// or if the player has ELKCHIEFFEATHER (tribe cured, ELKCHIEFTOKEN destroyed when given)



#include "M3PLOTINCLUDE"


int StartingConditional()
{
 int l_iResult;

 l_iResult = (GetPlayerAcceptedYusamQuest(GetPCSpeaker()) || ElkChiefDead() || HasPlagueBlankets(GetPCSpeaker())) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTUTHGARDTELKTRIBE") !=99;
return l_iResult;
}
