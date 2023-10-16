// plot is not complete, ring has been given away, PC speaker is the one ring given to

int StartingConditional()
{
    int bCondition =  GetLocalInt(GetModule(),"Evaine_Plot") < 100 &&
                      GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Ring_Given_To")) &&
                      GetLocalObject(OBJECT_SELF,"Ring_Given_To") == GetPCSpeaker();
    return bCondition;
}
