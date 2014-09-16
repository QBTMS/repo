package service;

import model.CompletedProject;

import java.util.List;

/**
 * Created by prasad on 9/16/14.
 */
public interface CompletedProjectService {
    public void addCompletedProject(CompletedProject completedproject);

    public List<CompletedProject> listMyCompletedProject();

    public List<CompletedProject> listAsignedCompletedProject();

    public CompletedProject getCompletedProject(long projectId);

    public void deleteCompletedProject(CompletedProject completedproject);

    public CompletedProject findById(long projectId);

    public void completedUpdate(long projectId, int completenessLevel);
}
