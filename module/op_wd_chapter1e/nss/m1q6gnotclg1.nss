int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_HENCHMAN,GetPCSpeaker())) &&
                     GetAssociate(ASSOCIATE_TYPE_HENCHMAN,GetPCSpeaker()) == GetLocalObject(GetModule(),"NW_G_M1Q6D01Grobah");
    return bCondition;
}
