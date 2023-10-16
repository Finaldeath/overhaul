// advance Jaboli's story global

void main()
{
    int nStory = GetLocalInt(GetModule(), "x2_hen_jabstory");
    SetLocalInt(GetModule(), "x2_hen_jabstory", (nStory + 1));
}
