// To avoid having duplicates copies of sabal, she would destroy herself if she steps on this trigger

void main()
{
    object oEnter = GetEnteringObject();
    if(GetTag(oEnter) == "q6_sabal")
        DestroyObject(oEnter);
}
