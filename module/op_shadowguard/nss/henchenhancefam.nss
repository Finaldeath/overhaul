#include "NW_I0_GENERIC"

void main()
{
    object oAss = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,GetPCSpeaker());
    int iBuffed = TalentUseProtectionOthers(oAss);
//    if (!iBuffed) iBuffed = TalentEnhanceOthers(oAss,TRUE);
    if (!iBuffed) iBuffed = TalentEnhanceOthers();
    SetLocalInt(GetPCSpeaker(),"BuffedUp",iBuffed);
}
