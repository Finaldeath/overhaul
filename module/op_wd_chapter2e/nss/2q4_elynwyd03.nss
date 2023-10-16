// plot not done, ring has been given away...but not to the PC speaker

int StartingConditional()
{
    int bCondition =  GetLocalInt(GetModule(),"Evaine_Plot") < 100 &&
                      GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Ring_Given_To")) &&
                      GetLocalObject(OBJECT_SELF,"Ring_Given_To") != GetPCSpeaker();
    return bCondition;
}
