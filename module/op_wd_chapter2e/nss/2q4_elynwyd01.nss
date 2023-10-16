// the plot is not done and Elynwyd has not given away the ring

int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"Evaine_Plot") < 100 &&
                     !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Ring_Given_To"));
    return bCondition;
}

