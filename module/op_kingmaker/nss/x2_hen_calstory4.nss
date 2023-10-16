// advance Calibast's story global

void main()
{
    int nStory = GetLocalInt(GetModule(), "x2_hen_calstory");
    SetLocalInt(GetModule(), "x2_hen_calstory", (nStory + 1));
}
