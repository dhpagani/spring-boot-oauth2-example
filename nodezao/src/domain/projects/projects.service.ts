import { Injectable } from '@nestjs/common';
import { AbstractService } from '../core/abstract.service';
import { Project } from './project.entity';
import { ProjectsRepository } from './projects.repository';

@Injectable()
export class ProjectsService extends AbstractService<Project> {
    constructor(readonly repo: ProjectsRepository) {
        super(repo);
    }
}
