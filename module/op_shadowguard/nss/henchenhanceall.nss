#include "NW_I0_GENERIC"

void main()
{
    int    i;
    object oTarget;

    ActionPauseConversation();
    SetAssociateState(NW_ASC_IS_BUSY,TRUE);
    ClearAllActions();
    int nBuff = 0;

    for (i = 1; i <= 7; ++i) {
        if (i == 1) oTarget = GetPCSpeaker();
        if (i == 2) oTarget = OBJECT_SELF;
        if (i == 3) oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,GetPCSpeaker());
        if (i == 4) oTarget = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,GetPCSpeaker());
        if (i == 5) oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED,GetPCSpeaker());
        if (i == 6) oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED,OBJECT_SELF);
        if (i == 7) oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,OBJECT_SELF);
        if (GetIsObjectValid(oTarget)) {
            int iBuffed = TRUE;

            while (iBuffed) {
//                iBuffed = TalentUseProtectionOthers(oTarget,FALSE);
                iBuffed = TalentUseProtectionOthers(oTarget);
//                if (!iBuffed) iBuffed = TalentEnhanceOthers(oTarget,TRUE,FALSE);
                if (!iBuffed) iBuffed = TalentEnhanceOthers();
                if (iBuffed) ++nBuff;
            }
            SetLocalInt(oTarget,"nCast",0);
        }
    }

    if (nBuff > 0) {
        SetLocalInt(GetPCSpeaker(),"BuffedUp",TRUE);
        ActionDoCommand(ActionStartConversation(GetMaster()));
    }
    else
        SetLocalInt(GetPCSpeaker(),"BuffedUp",FALSE);
    //SetAssociateState(NW_ASC_IS_BUSY,FALSE);
}
