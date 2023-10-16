// Chapter 1 is basically over, waiting for the PC to tie up loose ends

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q1_Chapter_Over") == 1;
    return iResult;
}
