////////Give player small evil hit and 50 gold,
////////set speaker to react negatively to player
////////Closes off dialog options with player
/////// Marks that character already gave gold to someone and is now broke

#include "nw_i0_plot"

void main()
{

    SetLocalInt(OBJECT_SELF,"Evil",1);
    SetLocalObject(OBJECT_SELF,"Evil",GetPCSpeaker());
    RewardGP(50,GetPCSpeaker(),FALSE);
    AutoAlignE(DC_EASY, GetPCSpeaker());

}


